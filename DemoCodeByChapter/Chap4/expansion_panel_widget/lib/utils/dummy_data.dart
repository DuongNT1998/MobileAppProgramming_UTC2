class PanelData {
  final String title;
  final String content;
  bool isExpanded;

  PanelData({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}
