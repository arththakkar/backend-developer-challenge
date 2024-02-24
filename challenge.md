# Take-Home Assignment: Ruby on Rails API with Basic Authentication and
Candidate Voting System

## Overview
Develop a Ruby on Rails API application that features a basic authentication
system and a voting mechanism for two candidates, "Candidate A" and "Candidate
B". The application will enable authenticated users to cast and revise their
votes for these candidates.

## Requirements

### Application Setup
- Build a Ruby on Rails API-only application.
- Implement a basic authentication system (e.g., username and password).
- Include `User` and `Vote` models, linking `Votes` to `Users` and the chosen
  Candidate.

### Voting System
- Users can cast a single vote for either "Candidate A" or "Candidate B".
- Allow users to change their vote up to two times within a 24-hour period from
  their initial vote.
  - Design logic to track vote changes and enforce the 24-hour rule.
  - Include an endpoint to retrieve the current vote counts for each candidate.
  - Note: Only vote creation and update functionalities are required. Deletion
    of votes is not necessary.

### Testing
- Use Minitest for writing tests for models, API endpoints, and the voting
  logic.
  - Focus on key functionalities and edge cases in the voting system.

### Documentation
- Create a README with detailed setup, operation instructions, and API endpoint
  documentation.

## Evaluation Criteria
- **Ruby on Rails Expertise:** Quality of code, implementation of required
  features, adherence to best practices.
  - **Testing Acumen:** Coverage and accuracy of Minitest implementations.
  - **Authentication System:** Secure and effective implementation of the basic
    authentication system.
    - **Voting Mechanism:** Efficiency and robustness of the voting logic.

## Timeframe and Submission Guidelines
- **Timeframe for Completion:** You have 72 hours to complete this assignment.
- **Expected Time Commitment:** The task should not take more than 4 hours to
  complete.
  - **Submission:** Fork this repository and make your fork **private**, add your 
  changes (usage of good practices for git is expected) and add @angvp to your 
  contributors list, after that send an email to angel.velasquez@virtuo.com to
  confirm that you added the reviewer, don't create a pull request against the
  original repo, this is your fork, make the commits there.


## Next Steps
If your solution is complete and meets the requirements, the next step will be
a discussion session. In this session, we will review your code together, and
you will have the opportunity to explain your approach, decisions, and any
challenges you faced.

---

### Notes for the Candidate
- **Efficiency and Focus:** Prioritize the core functionalities of
  authentication and the voting mechanism, aiming for a balance between
  functionality and code quality.
  - **Preparation for Discussion:** Be prepared to discuss and rationalize your
    design and code choices during the follow-up session.
