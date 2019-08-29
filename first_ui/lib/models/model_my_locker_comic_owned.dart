



class ModelMyLockerComicOwned
{
  String _comicId;
  String _userId;
  String _title;
  String _url;
  String _thumbnailUrl;

  String get comicId => _comicId;
  String get userId => _userId;
  String get title => _title;
  String get url => _url;
  String get thumbnailUrl => _thumbnailUrl;

  set comicId(String comicId)
  {
    _comicId = comicId;
  }

  set userId(String userId)
  {
    _userId = userId;
  }

  set title(String title)
  {
    _title = title;
  }

  set url(String url)
  {
    _url = url;
  }

  set thumbnailUrl(String thumbnailUrl)
  {
    _thumbnailUrl = thumbnailUrl;
  }

  @override
  String toString()
  {
    return 'userId : $_userId , comicId : $_comicId , title : $_title , thumbnailUrl : $thumbnailUrl';
  }

  static List<ModelMyLockerComicOwned> list;
}