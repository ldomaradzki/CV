## CV
<img src="https://github.com/ldomaradzki/CV/blob/main/video.gif?raw=true" alt="video" width="480" height="335"/>

## Description
This application was made to showcase writing iOS application using latest Xcode/Swift without any needs for external libraries. I chose to use Core Data as my main data source. 
On first run application downloads data from githubs gist page, parses it and saves to Core Data persistent storage (by default its sqlite).
Application consists of 3 pages - About me, Skills and Work experience. In every page I tried to use different way to showcase data - using table view, custom views with Auto Layout or just trying something fun with UIDynamics.
Code was written to easily extend for more data, pages and content. Most functionality was unit tested.

## Stack
- user interface - UIKit & Auto Layout
- cache/offline db - Core Data
- networking - URLSession

## Methodology
Mostly MVVM and Coordinator pattern.