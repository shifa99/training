class ItemGroup {
  String title;
  String imageName;
  ItemGroup({required this.imageName, required this.title});
}

List<ItemGroup> itemsGroups = [
  ItemGroup(imageName: 'images/book.png', title: 'منشور'),
  ItemGroup(imageName: 'images/video2.png', title: 'فيديو'),
  ItemGroup(imageName: 'images/discuss2.png', title: 'مناقشة'),
  ItemGroup(imageName: 'images/homework2.png', title: 'واجب'),
];
