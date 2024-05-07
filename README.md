# SimpleArticles

## Goal
Take a simple view controller called `ArticlesViewController` and apply mock PR changes to it.
- Fix nits
- Add unit tests (use dependency injection and test doubles to make this possible)
- Check for memory leaks using unit test helpers
- Fix any compiler issues `self?.articles = articles`
- Use codable for model objects that would encode/decode json data

## Actual Steps Taken
- [x] Fixed nits
- [x] Added unit tests (created spy to check fetch call count and asserted on numer of table rows)
- [x] Checked for memory leaks using unit test helpers
- [x] Used weak references as needed
- [x] Made `Article` codable for future json parsing
- [x] Made use of `private` and `final` as needed
- [x] Convert `ArticlesViewController` to `ArticlesTableViewController`

## Screenshots

### View
![Simulator Screenshot - iPhone 15 Pro - 2024-05-06 at 19 55 40](https://github.com/wsaults/SimpleArticles/assets/466656/03a12299-8fca-46a3-b143-ab4ce70a20b0)

### Tests
<img width="383" alt="Screenshot 2024-05-06 at 8 07 24 PM" src="https://github.com/wsaults/SimpleArticles/assets/466656/cb62e1a2-7e99-4d76-91f2-2ca26aa6bf4c">


