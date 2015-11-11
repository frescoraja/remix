#Try it out live:

[Heroku Live Link](http://mediamixer.herokuapp.com)

Here's my Video serving app from the data.json file provided. I seeded a POSTGRESQL database using the json file, since some of the data in the file was irrelevant (empty string tags, some videos had ID fields with erroneous content), I did end up 'massaging' the data a little (see seeds.rb).
For me, one of the biggest considerations was how to model the data. As-is, the json file provides an array of strings for the video tags. For simpicity, this is the way I implemented tags on the video. If I had more time to work on this project, I would have probably created a separate "Tags" model that would just consist of a name field and a "Taggings" join table that would have a foreign key for a video and a foreign key referencing a tag. This way, searching for videos by tags, grouping by tag, and having all tags available for video creation would be much more performant and efficient. Since I used an array inside the video model, my text search only returns matches in the title and description of the video. If I included tags in the text search, I would have to iterate over each tag of each video to find matches, querying the database way too many times per search to be considered.
I also sacrificed adding features and styling over testing. If I had more time, I would have written unit tests to validate my forms were working as expected, that I was creating, updating the models appropriately and I would have spent more time to consider making all inputs santized.
I ended up getting kind of carried away with the tags form implementation, using javascript to dynamically create/delete tags for a model inside the model forms. Had I spent less time on that feature, I would have had more time with styling the site, making the show page better, maybe addressing the tags model issue mentioned above.
Thanks for the project, as always a learning experience and I look forward to any feedback!
David Carter


# Run locally
clone the repo, fire up the rails server ```rails s```, and point a browser to ```localhost:3000```
