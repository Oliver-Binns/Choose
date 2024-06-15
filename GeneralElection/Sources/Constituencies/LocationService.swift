import CoreLocation

public enum LocationError: Error {
    case geocodeFailed
    case outsideUK
    case permissionDenied
}

final class LocationService: NSObject {
    private let locationManager: CLLocationManager
    private let geocoder: CLGeocoder
    private var locationContinuation: CheckedContinuation<CLLocation, Error>?

    init(locationManager: CLLocationManager,
         geocoder: CLGeocoder = CLGeocoder()) {
        self.locationManager = locationManager
        self.geocoder = geocoder
        super.init()
        locationManager.delegate = self
    }

    convenience override init() {
        self.init(locationManager: .init())
    }

    func getLocation() async throws -> CLLocation {
        let status = locationManager.authorizationStatus
        switch status {
        case .denied, .restricted:
            throw LocationError.permissionDenied
        default: break
        }

        return try await withCheckedThrowingContinuation { continuation in
            self.locationContinuation = continuation
            locationManager.requestLocation()
        }
    }

    func lookupPostcode(from location: CLLocation) async throws -> String {
        guard let placemark = try await geocoder
            .reverseGeocodeLocation(location).first,
              let postalCode = placemark.postalCode else {
            throw LocationError.geocodeFailed
        }
        guard placemark.country == "United Kingdom" else {
            throw LocationError.outsideUK
        }
        return postalCode
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        locationManager.stopUpdatingLocation()
        locationContinuation?.resume(returning: location)
        locationContinuation = nil
    }

    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
    }
}

extension LocationService: PostcodeService {
    func getPostcode() async throws -> String {
        let location = try await getLocation()
        return try await lookupPostcode(from: location)
    }
}
