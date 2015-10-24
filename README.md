# curlbrash

This is an installer script to fix the blight of people doing `curl ... | sudo sh` in your infrastructure.

See [my presentation from LASCON 2015](https://speakerdeck.com/barnbarn/security-for-non-unicorns-2?slide=36)

## Installation

Ironically:

```bash
curl -s https://raw.githubusercontent.com/barn/curlbrash/master/install.sh | sudo sh
```

Yup!

## Usage

Curl is now a shellscript that will check if stdout is a pipe. If it is, it will check to see if 'sudo sh' (and other shells) are running on the same tty. If there are, then it bails out, telling you this is a terrible idea.

Any other usage of curl is just passed straight through.

## What?

"You're joking right?"

Well kind of. It's partly to make a point. See the presentation.

"What's wrong with 'curl | bash' ?"

Well, a bunch of things. Not least that it leaves no trace of what actually happened when you ran it. Nothing left on disk. Which is my main problem.

## Who did this?

[@benjammingh](https://twitter.com/benjammingh) on the Twitters.
