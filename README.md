#Micro Git Features:

 1. A simple elegant UI
 2. App theme controlled from a single point.
 3. Ability to search popular Git repositories by language, default is
    Objective-c
 4. All data is paginated by 20 records per page. You can scroll through
    as many repositories as you want. Next page will be automatically
    reloaded when you scroll table view till end.
 5. Repositories are sorted by their star-count.
 6. By clicking on individual repository you can browse following data
>  1. Open Issues
>  2. Closed Issues
>  3. Open Pull Requests
>  4. Closed Pull Requests
>  5. Contributors - (Again there is no limit on data, you can paginate
>      through all of above data, next page will be automatically loaded
>      once you will reach end of page)


<img src="https://github.com/nabeelarif/MicroGit/blob/master/Screenshots/1-MicroGitHomePage.png" alt="MicroGit's Home Page" width="200" height="357">
<img src="https://github.com/nabeelarif/MicroGit/blob/master/Screenshots/2-MicroGitSearchPage.png" alt="MicroGit's Search page" width="200" height="357">
<img src="https://github.com/nabeelarif/MicroGit/blob/master/Screenshots/3-MicroGitExploreRepo.png" alt="MicroGit's See details of repo" width="200" height="357">
<img src="https://github.com/nabeelarif/MicroGit/blob/master/Screenshots/4-MicroGitOpenpullRequests.png" alt="MicroGit's Open Pull Requests Page" width="200" height="357">
<img src="https://github.com/nabeelarif/MicroGit/blob/master/Screenshots/5-MicroGitContributers.png" alt="MicroGit's Contributors of Repo Page" width="200" height="357">


#Version Control:
Git is used to manage the code of Micro Git

#Data storage:
All data is stored Core Data and Wrapper API [MagicalRecords](https://github.com/magicalpanda/MagicalRecord) is used to interact with it.
[Mogenerator](https://github.com/rentzsch/mogenerator) is used generate Auto generated Model classes.

#Git API:
API: https://developer.github.com/v3/
Networking API: [AFNetworking](https://github.com/AFNetworking/AFNetworking)

#Dependency Management
All 3rd party APIs used are integrated via Cocoapods

#Git Icons:
For different icons in the application Git font is used which is provided here https://octicons.github.com/

#Unit and UITest:
Some Unit and UI Test cases are also added for demonstration.

#Image Downloading:
[SDWebImage](https://github.com/rs/SDWebImage) is used to mange image downloading and caching.

**Language:** Objective-C