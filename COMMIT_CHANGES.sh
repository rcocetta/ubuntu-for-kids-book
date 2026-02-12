#!/bin/bash

# Script to commit all recent changes to the Ubuntu for Kids book

echo "Cleaning up any git lock files..."
rm -f .git/index.lock .git/HEAD.lock .git/objects/maintenance.lock 2>/dev/null

echo "Adding all changes..."
git add -A

echo "Committing changes..."
git commit -m "Add images, diagrams, and AI transparency

Major Updates:
- Added AI transparency section to Introduction and README
- Created 6 custom SVG educational diagrams
- Integrated diagrams into Chapters 1, 2, 3, and 7
- Added Ubuntu logo reference (download instructions included)
- Created comprehensive image guides

New Files:
- COLORFUL_IMAGES_GUIDE.md - Guide for finding CC images
- ADDING_IMAGES_GUIDE.md - How to add images to book
- IMAGES_COMPLETE.md - Summary of diagram integration
- IMAGES_UPDATE.md - Image work summary
- images/ATTRIBUTIONS.md - Image license tracking
- images/README.md - Images folder documentation

Custom SVG Diagrams Created (6 total):
- input-process-output.svg - How computers work
- computer-parts-simple.svg - Complete computer system
- files-and-folders.svg - Filing cabinet analogy
- internet-network.svg - Connected computers
- browser-parts.svg - Browser window anatomy
- terminal-command.svg - Command structure

Chapter Updates:
- Chapter 1: Added 2 diagrams (input-process-output, computer-parts)
- Chapter 2: Added 1 diagram (files-and-folders)
- Chapter 3: Added 2 diagrams (internet-network, browser-parts)
- Chapter 7: Added 1 diagram (terminal-command)

Transparency Updates:
- Introduction: Added 'About This Book's Creation' section
- README: Expanded with 'Creation & AI Transparency' section
- Clear attribution of AI assistance (Claude by Anthropic)
- Emphasis on human design and direction

Ubuntu Logo:
- Added logo reference to Introduction and README
- Included trademark attribution
- Created download instructions (DOWNLOAD_UBUNTU_LOGO.md)

All image paths verified and working correctly.

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

echo "Done! Checking status..."
git status
