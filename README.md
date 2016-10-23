First, make a Collection View Controller. `File -> New -> File -> Cocoa Touch Class` and make your file a subclass of UICollectionViewController. Don't forget to remove the old View COntroller from the storyboard, add a collection view controller instead, and set the class to be that of our recently made file.

Next we want to have our networking code return an array of album URLs. Because it's an asynchronous call, we'll be doing this in a `completion handler` (closure). This will allow us to have a reference in our collection view to know to update the screen when we have our data back from the network.

The steps to making this project:

0. ~~start new project~~
1. ~~download itunes data~~
2. create collection view cell for each album (you are here)
3. create a custom cell with default image for each album
4. download album artwork and replace default image with it
5. display album title and year when cell is tapped

There will be a branch representing each of the above steps. If you're having trouble, pull down that branch for a hint.
