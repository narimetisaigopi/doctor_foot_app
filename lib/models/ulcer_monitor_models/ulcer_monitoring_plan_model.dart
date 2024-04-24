class UlcerMonitoringPlanModel {
  String id;
  String planTitle;
  int planAmount;
  String planDuration;
  List<String> planDetailItems;
  UlcerMonitoringPlanModel(
      {this.planTitle = '',
      this.id = '0',
      this.planAmount = 0,
      this.planDuration = '',
      this.planDetailItems = const []});
}

// List<UlcerMonitoringPlanModel> freePlanList = [
//   UlcerMonitoringPlanModel(
//     text: Strings.weeklyUmText,
//   ),
//   UlcerMonitoringPlanModel(
//     text: Strings.freePlanText1,
//   ),
//   UlcerMonitoringPlanModel(
//     text: Strings.freePlanText2,
//   ),
// ];
