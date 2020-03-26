# Boris-bikes


# Description

A program that mimics the functionality of a docking station with boris bikes.
It will keep track of how many boris bikes are taken and how many spaces are available at the docking station.

# User Stories

``` 
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.

```

# Tech Used

- Ruby
- RSpec

# Testing

Tests were written with RSpec. To run the tests in terminal:

```
$> cd boris-bikes
$> rspec
```

# Installation

- Fork this repository
- Clone this repository to your local machine
- From inside the boris-bikes directory type the following in your command line:

```
$ irb
  > require './lib/docking_station.rb'
  > station = DockingStation.new
  > bike = Bike.new
```
  

# Usage

This programme is run on ruby within a REPL such as irb or pry

<insert pic of irb here>

A docking station has a default capacity of 20, but you can specify a larger capacity on creation:

```
docking_station = DockingStation.new(30)
```

The docking station will raise an error if:

- You try to dock a bike but it is full
- You try to release a bike but it is empty
- You try to release a broken bike


# Project Status

- In progress - Step 20 
- Last two user stories to be implemented
- To complete post challenge extensions 
- Could be developed further to implement front-end ineterface
