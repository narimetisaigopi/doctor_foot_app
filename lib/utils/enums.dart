enum PaymentStatus { none, pending, completed, cancelled, refunded }
enum AppointmentStatus {
  none,
  pending,
  booked,
  confirmed,
  cancelled,
  completed
}
enum PaymentServiceType { none, ulcerMonitoring, homeService, drAppointment }

// home dressing service
enum OrderStatus { none, upcoming, completed, cancelled }

enum FootServiceType {
  none,
  dressingAtHomeSmall,
  dressingAtHomeModerate,
  dressingAtHomeLarge,
  dressingAtHomeHuge,
  nailTrimming,
  footCleaning,
}

enum DressingServices { small, moderate, large, huge }
enum DressingServicesItem { title, image, dicription }

enum ReviewType { homeService, appointment }
enum NotificationType { all }
enum DietType { veg, nonveg }
enum DoctorAppointmentType {
  consultYourDoctor,
  onlineConsultation,
  footScreeningService,
  skinAndNail,
  toeDeformities,
  footPain,
  footDeformities,
  sportsInjuries,
  footAndAnkleArthritis
}
