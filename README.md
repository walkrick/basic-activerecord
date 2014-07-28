# Basic ActiveRecord

Let's write some ActiveRecord! Woo!

## Setup

1. Fork and clone this repository
1. `createdb basic_activerecord`
1. Create a new Tracker project and import the stories in `stories.csv`
1. Work through stories

## What we are working with

We will be working with four tables: customers, items, orders, and orderitems.
These tables should be familiar. In fact, this whole exercise should be familiar,
since the stories are the same ones we did when we started working with SQL.

The tables look like this:

**customers**

    Column   |  Type   |                       Modifiers
    ---------+---------+--------------------------------------------------------
     id      | integer | not null default nextval('customers_id_seq'::regclass)
     name    | text    |
     email   | text    |
     address | text    |
     city    | text    |
     state   | text    |
     zipcode | text    |

**items**

     Column      |  Type   |                     Modifiers
    -------------+---------+----------------------------------------------------
     id          | integer | not null default nextval('items_id_seq'::regclass)
     name        | text    |
     description | text    |

**orders**

     Column      |  Type   |                      Modifiers
    -------------+---------+-----------------------------------------------------
     id          | integer | not null default nextval('orders_id_seq'::regclass)
     customer_id | integer |
     amount      | numeric |

 **orderitems**

       Column  |  Type   |                        Modifiers
     ----------+---------+---------------------------------------------------------
      id       | integer | not null default nextval('orderitems_id_seq'::regclass)
      order_id | integer |
      item_id  | integer |

In the second story, you will insert a bunch of data into these tables so you
have some data to work with for the exercise.

## Enter ActiveRecord

So far, to talk to a database, we have been writing SQL queries by hand and using
the #sql method to send our hand written queries to the database. Now we are
going to let ActiveRecord handle the work of not only talking to the database but
also generating the SQL to be executed as well.

There is an ActiveRecord model for each of the tables listed above.

- `lib/customer.rb`
- `lib/item.rb`
- `lib/order.rb`
- `lib/orderitems.rb`

Inside each of these files you will see an ActiveRecord class, similar to:

    require "active_record"

    class Customer < ActiveRecord::Base
    end

We will use each of these ActiveRecord models throughout the exercise.

Try this before moving on: open the `lib/exercise.rb` file, and edit it so
that it looks like this:

    require "./lib/connection"

    require "./lib/customer"
    require "./lib/item"
    require "./lib/orderitem"
    require "./lib/order"

    p Customer.all

To try this out, execute the `lib/exercise.rb` file:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/basic-activerecord
    ± |master ✗| → ruby lib/exercise.rb
    #<ActiveRecord::Relation [#<Customer id: 1, name: "Donato Rempel", email: "ladarius@waelchi.org", address: "890 Ullrich Plains", city: "Janachester", state: "Virginia", zipcode: "77714">, #<Customer id: 2, name: "Tyrell Von DDS", email: "cleo_frami@bartondenesik.name", address: "63337 Abdullah Camp", city: "Verdieborough", state: "Colorado", zipcode: "69882-7027">, #<Customer id: 3, name: "Ms. Sofia Rowe", email: "jacky_funk@bayerprosacco.name", address: "1991 Kyler Village", city: "Opheliaborough", state: "Ohio", zipcode: "15599-5395">, #<Customer id: 4, name: "Evert Pfeffer", email: "alisa.luettgen@hoeger.org", address: "1311 Khalil Shores", city: "Port Ozella", state: "Arizona", zipcode: "34713">, #<Customer id: 5, name: "Elta Dicki", email: "lesly@heaney.org", address: "3878 Alyce Lock", city: "Deckowtown", state: "Montana", zipcode: "42114-6195">, #<Customer id: 6, name: "Zelma Davis", email: "osborne@mohr.biz", address: "184 Hazel Lane", city: "Alport", state: "Ohio", zipcode: "87119">, #<Customer id: 7, name: "Edna Hintz", email: "elisha_mclaughlin@pouros.biz", address: "2550 Hassan Pass", city: "North Kelliestad", state: "California", zipcode: "40909-5637">, #<Customer id: 8, name: "Coleman Prohaska Jr.", email: "taryn.becker@doyle.org", address: "32202 Zemlak Ridge", city: "Rigobertoside", state: "Colorado", zipcode: "95667-8653">, #<Customer id: 9, name: "Wilhelmine Huels", email: "alexander_rice@ornjakubowski.com", address: "44097 Elvie Divide", city: "West Lauryntown", state: "Maine", zipcode: "55164-9178">, #<Customer id: 10, name: "Hulda Will III", email: "ella_sanford@stracke.com", address: "3746 Ashton Divide", city: "Mikeberg", state: "Florida", zipcode: "22826">]>

If you see something similar, then you are good to go for the exercise.

## Working through these stories

This exercise is set up so that you can edit the `lib/exercise.rb` file for each story.
Each story should follow these steps:

1. Write the Ruby code you need to satisfy a story
1. Make a commit when you are done
1. Start the next story and erase the code you wrote for the previous story

Here is an example. One of the first stories is "display first 5 customers".
There is a `#limit` method in ActiveRecord that we can use to limit the
number of records returned.

    require "./lib/connection"

    require "./lib/customer"
    require "./lib/item"
    require "./lib/orderitem"
    require "./lib/order"

    p Customer.limit(5)

Try running that from the command line.

## How do I know I have completed a story

We aren't going to write any automated tests for this exercise. However,
you still want to make sure that you have successfully completed each story
before moving on to the next one.

Just like when we are writing tests, it is a good idea to have an expectation
for what the results for each story should be. If you are having a hard time
seeing what results you'd expect for a story, you could try opening `psql`
and writing the SQL by hand. Then when you write your query with ActiveRecord,
you would make sure that the results that come back look the same.

## What SQL is ActiveRecord executing?

One last tip. When you are debugging a story, you might want to see what SQL
ActiveRecord is actually generating. You can do this using the `#to_sql` method.
Here is an example using the "display first 5 customers" story in `lib/exercise.rb`.

    require "./lib/connection"

    require "./lib/customer"
    require "./lib/item"
    require "./lib/orderitem"
    require "./lib/order"

    puts Customer.limit(5).to_sql

Executing that Ruby script with `ruby lib/exercise.rb` gives you this output:

    |ruby-2.1.1@gschool| Hunters-MacBook-Pro in ~/gschool/dev/exercises/basic-activerecord
    ± |master ✗| → ruby lib/exercise.rb
    SELECT  "customers".* FROM "customers"  LIMIT 5

Because the script called the `#to_sql`, instead of executing the query we see
the SQL string that ActiveRecord generated.

## Getting Help

To see what methods are available, check out this ActiveRecord documentation:

[http://guides.rubyonrails.org/active_record_querying.html](http://guides.rubyonrails.org/active_record_querying.html)