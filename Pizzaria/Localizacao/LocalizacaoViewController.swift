import Foundation
import GoogleMaps

class ViewControllerLocalizacao: UIViewController {
    @IBOutlet weak var tituloLocalizacao: UILabel!
    @IBOutlet weak var mapViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLocalizacao.blackBorder()
        
        let camera = GMSCameraPosition.camera(withLatitude: -31.7654, longitude: -52.3376, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapViewContainer.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapViewContainer.topAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
        mapViewContainer.bottomAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        mapViewContainer.leadingAnchor.constraint(equalTo: mapView.leadingAnchor).isActive = true
        mapViewContainer.trailingAnchor.constraint(equalTo: mapView.trailingAnchor).isActive = true
        
    }
}
