# README
  ## Databases

  ### USERS

| column   | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| name     |string(NOT NULL)  |
| email    |text(NOT NULL)    |
| password |string(NOT NULL)  |

  #### Association
    has_one :shelf
    has_many :reviews
    has_many :books


  ### BOOKS

| column       | type             |
|:-------------|:-----------------|
| id           |integer(NOT NULL) |
| title        |string(NOT NULL)  |
| author       |text(NOT NULL)    |
| release_date |text              |
| price        |string            |


  ### SHELFS

| column   | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| name     |string(NOT NULL)  |
| user_id  |integer(NOT NULL) |

  #### Association
    belongs_to :user
    has_many :reviews
    has_many :books :through => :book_shelfs

  #### Index
    add_index :group_users, [:user_id]


  ### BOOK_SHELFS

| column   | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| book_id  | integer(NOT NULL) |
| shelf_id | integer(NOT NULL) |

  #### Association
    belongs_to :book
    belongs_to :shelf

  #### Index
    add_index :book_shelfs, [:book_id, shelf_id]


  ### REVIEWS

| column    | type              |
|:----------|:------------------|
| id        | integer(NOT NULL) |
| text      | text              |
| rate      | integer(NOT NULL) |
| user_id   | integer(NOT NULL) |
| book_id   | integer(NOT NULL) |
| shelf_id  | integer(NOT NULL) |
| status_id | integer           |

  #### Association
   belongs_to :user
   belongs_to :book
   belongs_to :shelf
   belongs_to :status

  #### Index
    add_index :rebiews, [:user_id, :book_id, :shelf_id, :satus_id]


  ### STATUSES

| column    | type              |
|:----------|:------------------|
| id        | integer(NOT NULL) |
| state     | string(NOT NULL)  |

  #### Association
    has_many :reviews
