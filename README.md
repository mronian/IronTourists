# Wanderer

Indian Tourism Information System

Contributors : Chander G, Pranay Yadav, Anchit Navelkar, Akash Mondal

##Introduction
Our project is to build an Indian Tourism Information System. This is the requirement analysis for the topic.


##Assumptions/Scope
This is an information management system, which means we only display information. There is no user input in form of ratings, reviews etc. Just a read only display.
We do not consider travel between two cities as a part of our system. Information about trains, flights, buses or horseback between cities have it’s place in a travel system, not a tourism system. However we consider transport details between individual spots and local airports, stations, bus-stops well within the scope.
As an addendum to the above point (2), we plan to have only approximate time-fare information between spots and hubs. This is explained in detail in this document.
Though the system is primarily about India, it is not restricted to this.


##Organization

The following are the basic entities or units in the system.

#####1.Spots
The central unit of tourism in our software. A single place you can visit. Sometimes a set of close-by places that are a part of the same cultural identity may be grouped into one spot. 

Spots are classified into types ( think Hindu temples, hill stations etc). We have travel details from hubs (see below) to spots, entrance fares to spots etc.   

#####2.Hubs
The main travel endpoints. Think railway stations, airports, cruise docks, important bus stops etc. As mentioned mainly to provide approximate time, fare details to nearby spots.

#####3.Hotels
These are places you can stay. For convenience, we group together normal hotels, resorts, clubs, beach houses etc into this category. We provide basic information, location, etc.

#####4.Restaurants
Once again we plan to lump together normal restaurants, bakeries, chat shops, dhabas, famous roadside eateries etc into one category. If hotels have associated restaurants, they are not mentioned here.

#####5.Cities 
The nearest landing points to individual spots.

#####6.States and Countries
Cities are organized in states and states in countries. Beyond this we do not have any information about states and countries.

#####7.Conveyance
These are the modes of transport found within a city and typically used to go to-from spots. These not only include conventional means like local trains, buses ,autorickshaws   and foot but also rarer means like horseback, cable cars, helicopters etc.

The main purpose of these conveyances in our system is to provide O(time) and O(money) information about conveyance between a spot and a hub. Note that we assume that this information is symmetrical and considered only one way.  O(n) refers to the standard algorithmic notation of approximation. We give this information per conveyance type per source destination pair. 

This means we for example say that getting from the Agra railway station to Taj Mahal (or vice versa) will take 0.5 hrs and 50 Rs by Rickshaw. For the same source-destination pair we also state that it takes 10min by walking. These are approximate estimation that the user can use to decide their course of action.


##System Information

Engineering aspects of the system.

We plan to gather data from the Internet by crawling. We plan to use sites like Trip Advisor etc for this search.

We intend to build a website with a frontend for user interaction and a backend to control the underlying  relational database.

##User View
What the user sees.

A front end to extract information on spots by various parameters. They can retrieve by spot names. They could get a list of spots grouped by city, type etc. They could look into hotels, restaurants near a spot, in a city etc. They could look up approximate fares for hotels, entrance fees for spots. They could find different ways to get from an hub to a spot.

These are just a few possible use case.


