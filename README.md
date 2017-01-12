# Ab

While writing an application that makes multiple requests against the GitHub
API and trying to use Bypass to test that these API calls occurred, we've
encountered errors if those API calls are async through either `Task.start` or
`Task.async |> Task.await`. This application is a contrived example to break
things down to the bare minimum to diagnose why these errors occur and attempt
to solve them.

We can use Bypass to handle API requests and evaluate the results provided the
API is called without starting a separate process using the `Task` module. If,
however, we use `Task` to break off separate processes to make multiple
requests, Bypass does not receive these requests. Our working hypothesis is
that the Bypass process is dying before the asyncronous tasks complete.

To see the passing test against an API without an async call:

    mix test --only no_async

To see the error messages when testing against an API that using async calls:

    mix test --only has_async

Strangely enough, on occassion all the tests pass when running all the tests
with `mix test`. Repeated running of the suite with `mix test`, however, will
pass or fail intermittently. This implies the failures are due to some kind
of race condition.
