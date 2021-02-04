class Post {
  String body;
  String author;
  bool userLiked = false;
  int likes = 0;
  Post(this.author, this.body);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
}
