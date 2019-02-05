class Person <ActiveRecord::BASE

    has_many :people, 
    primary_key: id,
    foreign_key: house_id,
    class_name: :person
}
end