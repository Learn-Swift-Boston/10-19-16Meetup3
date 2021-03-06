In the 10/19/16 meetup, we reviewed the performance of several JSON mapping utilities (https://github.com/chordsNcode/jsonperf). The project utilizes Xcode's performance testing (part of the XCTest suite) to verify which JSON mapping technique is the most performant. The general findings were that all methods were able to create a reasonably large data object in a negible amount of time. Leaving the implementor to choose the mapper that provides the syntax they most prefer. If you use a parser that is not represented in the project, you are encouraged to either contact the creator (Matt) or issue a pull request.

We then begun [mobbing](https://en.wikipedia.org/wiki/Mob_programming) on a simple application. The intention of the application is to hit the iTunes search endpoint, pull down 25 albums' worth of data, and present the album covers in a [UICollectionView](https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started). However, due to time constraints, we were only able to pull down the data and display the URLs in the Collection View's cells. The code in the master branch of this repository will be left at the state the code was in by the end of the meetup. If you're interested in completing the task, I encourage you to ignore the other branches. If you're just interested in the final project, please check out the [5_wrap_up](https://github.com/Learn-Swift-Boston/10-19-16Meetup3/tree/5_wrap_up) branch.