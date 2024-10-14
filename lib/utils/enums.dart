enum PaymentStatus { none, pending, completed, cancelled, refunded }
enum AppointmentStatus {
  none,
  pending,
  booked,
  confirmed,
  cancelled,
  completed,
}
enum PaymentServiceType { none, ulcerMonitoring, homeService }

// home dressing service
enum OrderStatus { none, upcoming, completed, cancelled }

enum FootServices { 
  nailTrimmingService,
  dressingService,
  footCleaning,
  footware
}

enum DressingServices { small, moderate, large, huge }
enum DressingServicesItem { title, image, dicription }

enum ReviewType { homeService, appointment }
enum NotificationType { all }
