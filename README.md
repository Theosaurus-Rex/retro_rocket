# RetroRocket Retro & Vintage Toys

![RetroRocket Logo](https://pbs.twimg.com/media/Eu8YLf_VEAIIRA9?format=jpg&name=medium)

## What is RetroRocket?

Those of us who grew up pre-nineties enjoyed some amazing entertainment as children in the form of action figures, dolls, collectable trading cards and more. However, they just don't make 'em the way they used to!

Currently, there is no online platform where people can easily find these childhood treasures of decades past. There is no specific platform for these items - rather, they are buried under masses of other mass-produced items on sites such as eBay and Gumtree. That's where RetroRocket comes in. This two-sided marketplace connects sellers of childhood wonders with would-be owners, so that everyone can be reunited with their now hard-to-find childhood toys. 

## But why would anyone use this?

Unlike most toys and games today, action figures and other children's toys from pre-nineties have significant monetary value in addition to being robust products that have stood the test of time. Many adults who grew up with these items now collect them as a hobby, and, as is the nature of Retro and Vintage items in general, toys of this nature are becoming harder and harder to find as time goes on due to being out of production.

## Deployed Website

https://retro-rocket.herokuapp.com/

## Code Repository

https://github.com/Theosaurus-Rex/retro_rocket

## Description

### Purpose

The purpose of RetroRocket is to easily connect owners of vintage and retro toys with those looking to buy such items, all in an easily accessible online store format. It is aimed at users across Australia and is constructed on the premise of items being shipped to the buyer once they are purchased.

### Features & Functionality

- User sign-up to allow posting and purchasing different items on the site
- Categorisation of products
- Search system  
- Image upload to allow users to show off the condition of their toys 
- User profile to keep track of your items currently listed for sale


### Sitemap
![Sitemap for RetroRocket](https://i.ibb.co/Tcxxt46/Screen-Shot-2021-02-25-at-10-06-57-am.png)

### Screenshots
![Landing Page](https://i.ibb.co/mz2LptY/Screen-Shot-2021-03-16-at-10-21-43-am.png)
![Category Select](https://ibb.co/WVvqV1K)
![New Listing Form](https://i.ibb.co/z42VVWb/Screen-Shot-2021-03-16-at-10-22-11-am.png)
![Show Listing](https://ibb.co/QrNqWHW)

### Target Audience

RetroRocket is aimed at *Australian* users between the ages of *20 to 50* years old. It aims to ignite childhood nostalgia in this age range by providing a market for toys released between the 60s and 90s.

### Tech Stack

- HTML/CSS/JS
- Tailwind CSS
- Ruby/Ruby On Rails
- Github, Heroku

## User Stories

- As a *User*, I want to be able to sign up for an account.
- As a *User*, I want a website that is simple to use.
- As a *Buyer*, I need to know how much each item costs.
- As a *Buyer*, I need to know what condition each item is in to inform my purchase decisions.
- As a *Seller*, I want to be able to upload images of exactly what I'm selling.
- As a *Seller*, I want to get paid for items quickly so I can ship them out.

## Wireframes

**Landing Page**
![Landing Page Wireframe](https://i.ibb.co/LnBnpjk/Screen-Shot-2021-02-25-at-10-07-22-am.png)

**Category View**
![Category View Wireframe](https://i.ibb.co/F8j7WVy/Screen-Shot-2021-02-25-at-10-07-35-am.png)

**Individual Listing View**
![Listing View Wireframe](https://i.ibb.co/qNfz9jm/Screen-Shot-2021-02-25-at-10-07-49-am.png)

**User Profile View**
![User Profile View Wireframe](https://i.ibb.co/bsC9vRp/Screen-Shot-2021-02-25-at-10-08-04-am.png)

**New Listing Form**
![New Listing Form Wireframe](https://i.ibb.co/nkZKvtz/Screen-Shot-2021-02-25-at-10-08-17-am.png)

## Entity Relationship Diagram
![RetroRocket ERD](https://i.ibb.co/HBNDnn9/Screen-Shot-2021-03-18-at-8-20-26-am.png)

## Components/Abstractions

RetroRocket is built using Ruby On Rails, and therefore is abstracted by the nature of the Rails architecture and the Model/View/Controller design system. 

Users are a Model created with the Devise gem, which automatically authenticates Users to allow them access to buy and sell listings on RetroRocket, as well as edit/delete their own listings if they so choose. Additionally, Users have an attribute called "admin", which is a boolean value. If this is true, the User is given access to several other features, such as category creation. 

Listing creation is handled by ActiveRecord in Rails, which creates a Model from parameters passed by a user in the New Listing form. Upon submission of this form, the listing is written to the database and can be displayed in the appropriate Views to Users.

Querying data sets of listings is done simply through the View, by selecting the parameters for the search the User wishes to perform on the set of all listings depending on which attributes they are looking for in a product.

## Third-Party Service Integrations

Payments on RetroRocket are handled using the **Stripe** API to take card payments for items. Stripe also automatically handles all security aspects of payment processing.

Image hosting for listing images and user profile images is managed by **Cloudinary**, a media hosting solution.

The web application itself is hosted via **Heroku**'s hosting service.

## Models & ActiveRecord Relationships

**Users:**
- Have many Listings (Optional)

**Listings:**
- Have one Seller (Mandatory)
- Have one Image (Mandatory)
- Have one Category (Mandatory)

**Categories:**
- Have many Listings (Optional)


## Database Relations

Every User on RetroRocket is able to have multiple Listings (items they're selling) at once. Their user ID will be associated with each of these, allowing all items they are selling to be listed on their profile for easy viewing.

Each Listing will have a User ID associated with it as the "Seller" of the product. It will also be associated with a category by that Category ID. Additionally, listings can have images attached to them which are associated with the Listing ID.


## Database Schema
The following is a summary of the tables included in the schema.rb file for this project:

**Categories:**
- Category Name (String)

**Listings:**
- Listing Title (String)
- Listing Description (Text)
- User Id (The user selling the listing) (BigInt, FK)
- Price (Money)
- Condition (String)
- Category Id (BigInt, FK)
- Sold (Boolean)

**Users:**
- Email (String)
- Encrypted Password (String)
- Username (String)
- Admin (Boolean)

All tables were generated using Rails helper methods and migrated to the main database. Where Foreign Keys (FK) are present in the above data, the table is referencing another table in the denoted column. This forms the following relationships:

- Each Listing MUST have one User Id (the person who creates the listing). This is used to show who is selling the product and to allow editing and deleting Listings by their associated User.
- Each Listing MUST have one and only one Category. The Listing will show up in its associated Category's index page.
- Each User can optionally have Many Listings, or none.
- Each Category can optionally have Many Listings, or none.

Additionally, the schema.rb file contains Active Storage Attachments and Active Storage Blobs tables. These are used for storing the Images associated with each Listing. 

Tables also have a t.index line. These are used to efficiently call all rows from that table in a Model's "index" view, generated by default when using Rails helper methods. In this project, this is utilised, for example, on the landing page, which shows all Listings. 


## Task Allocation & Tracking

Tasks for development of RetroRocket are tracked using a Trello board found here: https://trello.com/b/7jMhnZjR/retrorocket

- **To-Do** lists tasks that have yet to be started
- **Doing** lists tasks that are partially complete and currently being worked on
- **Done** lists tasks that are finished and do not require testing
- **Testing** refers to tasks whose implementation in the production environment is currently being tested. Items here may be moved back to "Doing" if they require reworking or into "Done" if the tests run successfully
- **Resources** is a place to pin frequently accessed resources and assets such as APIs and design elements
