# Project: Rails Facebook clone

As a cohort of Microverse we were assignet the task to build a fully featured 
copy of Facebook.com using the framework Ruby on Rails.

Assignment desciption can be viewed on [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project). 

The project specifications were splitted into 9 milestones as follows:
- Milestone 1: Data architecture documentation, created the [ERD](https://github.com/ferreirati/mv-rails-06-finalproject/blob/develop/docs/ERD.png) (Entity Relation Diagram).

- Milestone 2: Project setup including PostgreSQL, Guard, Devise, Omniauth, Stickler-ci.

- Milestone 3: Users & posts
 
- Milestone 4: Comments & likes
 
- Milestone 5: Friendships v1, one row for each friendship relation, uses a confirmed flag.  
 
- Milestone 6: Friendships v2, more efficient queries using two rows per friendship and no confirmed flag.
 
- Milestone 7: Omniauth, federated login using Facebook account.
 
- Milestone 8: Heroku deploy
 
- Milestone 9: Final touches, add README.md file and general style improvements.  

### Technology

Ruby - Rails - ActiveRecord - PostgreSQL - Heroku - Guard - Devise - Omniauth - Stickler-ci.

### Authors

- **Oscar De La Lanza** - [@oscardelalanza](https://github.com/oscardelalanza)
- **Tiago Ferreira** - [@ferreirati](https://github.com/ferreirati)

### Links

- **Assignment page** - [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)
- **Live demo** - [Demo on Heroku](https://sleepy-caverns-46639.herokuapp.com/)

### Database structure
![ERD](https://github.com/ferreirati/mv-rails-06-finalproject/blob/develop/docs/ERD.png)

### Installation
- `bundle --without production`
- `yarn install --check-files`
- `rails db:migrate` 

### Start development server
- `rails server`

### Rails console
- `rails console`

### Integration tests
- `rails tests`

### Deploy to Heroku
- `git push heroku master`