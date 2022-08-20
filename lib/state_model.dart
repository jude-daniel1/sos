class StateModel {
  late final String state;
  late final String alias;
  late final List<String> lgas;

  StateModel({required this.state, required this.alias, required this.lgas});

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    alias = json['alias'];
    lgas = json['lgas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['alias'] = this.alias;
    data['lgas'] = this.lgas;
    return data;
  }
}
