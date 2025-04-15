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

enum FootServiceType {
  none,
  dressingAtHomeSmall,
  dressingAtHomeModerate,
  dressingAtHomeLarge,
  dressingAtHomeHuge,
  nailTrimming,
  footCleaning,
}

enum ReviewType { doctor, admin }

enum NotificationType { all }

enum DietType { veg, nonVeg }

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

enum FileType { image, pdf, video }

enum HealthRecordType { image, labReports, hospitalDocuments }

enum UlcerDocumentType { dischargeSummary, consultationDocument }

enum Flavor { user, partner, admin }
