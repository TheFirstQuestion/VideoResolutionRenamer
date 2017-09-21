# Video Resolution Renamer

VRR is a bash script to rename files by resolution, as a stopgap for Sonarr users. (see Sonarr issue #448: https://github.com/Sonarr/Sonarr/issues/448#issuecomment-328604201)

**At the moment, VRR only works for files with the following naming scheme:**

    something - something - something - Quality

For example:

    {Series Title} - s{season:00}e{episode:00} - {Episode Title} - {Quality Full}

**The information must be separated by " - " (space dash space) and the quality must be the 4th chunk.** If quality is not at the end, the script will add the new quality and not remove the old one. Sonarr may not pick up the new resolution.

See in Sonarr: Settings -> Media Management -> Episode Naming (show advanced settings)

## To Use

1. Clone the repository

1. Create blank files `newNames.txt` and `currentNames.txt`

2. `./listFiles.sh /path/to/your/shows`

3. `./videoResolutionRename.sh /path/to/your/shows`

To compare the old and new names:

    git diff --no-index --word-diff=color --word-diff-regex=. currentNames.txt newNames.txt


## Contributing
I'm new to Bash, and not very good at it. Any contributions (code, bug reports, testing, or reviews) are helpful!


## TODO
* Add Sonarr refresh + reorganize (via API)
* Allow other naming schemes
* Make sure all video file types are recognized
* A way to keep BluRay/WEB-DL/HDTV info in filename
