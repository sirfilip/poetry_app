class Publication

  def self.latest
    ActiveRecord::Base.connection.exec_query("
      select type, title, excerpt, published_at, author_name from (
        select 'Short Story' as type, title, description as excerpt, published_at, authors.name as author_name 
        from short_stories
        join authors on short_stories.author_id = authors.id

        union

        select 'Poem' as type, title, metaphor as excerpt, published_at, authors.name as author_name
        from poems
        join authors on poems.author_id = authors.id
      ) publications 
      order by published_at desc
      limit 10
    ").to_hash
  end

end
