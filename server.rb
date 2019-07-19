require 'sinatra'
require 'fileutils'

# get configuration
user = "apu-game"
password = "..." # please fill in!
repourl = "https://#{user}:#{password}@github.com/apu-game/AntiPatternsUnlocked"

# clone repository the first time, otherwise pull changes
rootdir = File.dirname(__FILE__)
repodir = File.expand_path("../repo", __FILE__)

Dir.chdir(rootdir)

unless File.directory?(repodir)
	system("git clone #{repourl}")
else
	Dir.chdir(repodir)
	system("git pull")
end

get '/' do
	erb :index
end

post '/create' do
	@branch = params[:branch]
	Dir.chdir(repodir)
	system("git branch #{@branch}")
	system("git checkout #{@branch}")
	system("git push --set-upstream origin #{@branch}")
	system("git checkout master")
	erb :create
end