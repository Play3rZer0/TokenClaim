# TokenClaim

A token claim contract that allows any token creator to distribute tokens to their users. Claimants can get tokens if they are able to
verify user address, passcode, and secret.

This is something that the developers should have in an off-chain database that stores information about the token users. The data is
hashed so tht it is not raw and revealed to the public since it is stored on-chain.

