# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_data = [
  {username: 'user1', password: 'password'},
  {username: 'user2', password: 'password'},
]
users = User.create(user_data)

story_data = [
  {name: 'Test story 1', description: 'Description 1', user: users.first},
  {name: 'Test story 2', description: 'Description 2', user: users.first},
  {name: 'Test story 3', description: 'Description 3', user: users.last},
]
stories = Story.create(story_data)

plot_point_data = [
  {
		name: "Point 1",
		description: "Description 1",
		visibility_radius: 1.5,
		latitude: 110.1234,
		longitude: -78.45918,
    story: stories.first
	},
  {
		name: "Point 2",
		description: "Description 2",
		visibility_radius: 1.5,
		latitude: 110.1232,
		longitude: -78.45916,
    story: stories.first
	},
  {
		name: "Point 3",
		description: "Description 3",
		visibility_radius: 1.5,
		latitude: 110.1231,
		longitude: -78.45915,
    story: stories.first
	},
  {
		name: "Point 4",
		description: "Description 4",
		visibility_radius: 1.5,
		latitude: 110.1230,
		longitude: -78.45914,
    story: stories.first
	},
  {
		name: "Point 5",
		description: "Description 5",
		visibility_radius: 1.5,
		latitude: 110.1230,
		longitude: -78.45914,
    story: stories.second
	},
  {
		name: "Point 6",
		description: "Description 6",
		visibility_radius: 1.5,
		latitude: 110.1230,
		longitude: -78.45914,
    story: stories.third
	},
]
plot_points = PlotPoint.create(plot_point_data)

plot_path_data = [
  {
		from: plot_points.first,
		to: plot_points.second,
    story: stories.first
	},
  {
		from: plot_points.second,
		to: plot_points.third,
    story: stories.first
	},
  {
		from: plot_points.second,
		to: plot_points.fourth,
    story: stories.first
	},
]
PlotPath.create(plot_path_data)
