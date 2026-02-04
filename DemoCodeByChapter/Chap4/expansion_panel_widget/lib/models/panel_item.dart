class PanelItem {
  final String header;
  final String body;
  bool isExpanded;

  PanelItem({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });
}
