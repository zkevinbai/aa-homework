class Person <ActiveRecord::BASE

    belongs_to :house, 
    primary_key: id,
    foreign_key: house_id,
    class_name: :house
}
end