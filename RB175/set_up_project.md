# Setting up new project

## Creating project directory
- `mkdir project_name`
- `cd project_name`
- `echo “# project_name description” >> README.md`
- `git init`
- `git add README.md`
- `git commit -m “Initial commit”`
- `git branch -M main` (-M flag is a short hand for  —move which forces to override and rename the branch even if its name is main)
- `git remote add origin git@github.com:USERNAME/project_name.git`
- `git push -u origin main` (-u flag stands for —set-upstream (set upstream tracking) which tells Git to remember that local branch should track the remote branch so next time can just use git push or git pull without specify the branch name

- lib folder contains project_name.rb
- test folder contains project_name_test.rb
- assets folder contains sub-folders: images -> images, javascript -> JavaScrip, stylesheet -> CSS and views -> HTML template
- `bundle install` scans gemfile -> install all dependencies & create gemfile.lock 
- Add `require "bundles/setup"` in project_name.rb (remove all gem directory from $LOAD_PATH, which makes Ruby cannot find gems -> `require "bundles/setup"` then uses gemfile.lock to add each gem’s directory to $LOAD_PATH)

## Troubleshooting

- run these commands if cannot change ruby versions on MAC

```
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

- `bundle exec gem_name` to solve dependencies issues & checking `binstubs` as the last resort for debugging
-  `in 'require': cannot load such file -- colorize (LoadError)` -> `Gemfile.lock` does not list `colorize` gem -> list `colorize` gem -> run `bundle install` to create new `Gemfile.lock`
- Remove `.bundle` directory -> run `bundle install`
- Remove `binstubs` directory -> run `bundle install --binstubs` (Only do this if using `binstubs` feature)
- Remove and reinstall Bundler -> `gem uninstall bundler` -> `gem install bundler`
- If `gem list` shows `rubygems-bundler` / `open_gem` are installed -> uninstall them
- At app's top-level directory -> `rm Gemfile.lock ; DEBUG_RESOLVER=1 bundle install`

## Relationships

- Your Ruby Version Manager is at the top level -- it controls multiple installations of Ruby and all the other tools.

- Within each installation of Ruby, you can have multiple Gems -- even 1000s of Gems if you want. Each Gem becomes accessible to the Ruby version under which it is installed. If you want to run a Gem in multiple versions of Ruby, you need to install it in all of the versions you want to use it with.

- Each Gem in a Ruby installation can itself have multiple versions. This frequently occurs naturally as you install updated Gems, but can also be a requirement; sometimes you just need a specific version of a Gem for one project, but want to use another version for your other projects.

- Ruby projects are programs and libraries that make use of Ruby as the primary development language. Each Ruby project is typically designed to use a specific version (or versions) of Ruby, and may also use a variety of different Gems.

- The Bundler program is itself a Gem that is used to manage the Gem dependencies of your projects. That is, it determines and controls the Ruby version and Gems that your project uses, and attempts to ensure that the proper items are installed and used when you run the program.

- Finally, Rake is another Gem. It isn't tied to any one Ruby project, but is, instead, a tool that you use to perform repetitive development tasks, such as running tests, building databases, packaging and releasing the software, etc. The tasks that Rake performs are varied, and frequently change from one project to another; you use the Rakefile file to control which tasks your project needs.

```
todolist_project
├── todolist_project.gemspec
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── lib
│   └── todolist_project.rb
└── test
    └── todolist_project_test.rb
```


