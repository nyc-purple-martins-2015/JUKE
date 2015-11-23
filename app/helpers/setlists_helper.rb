module SetlistsHelper

  def hide_update?
    @setlist.setlist_songs.where(list_status: 0).count != 0
  end
end
