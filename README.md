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

## Screenshot