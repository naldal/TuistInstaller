echo "\n\nHi. This is Tuist Project Setting Manager.\nThis will set a few tasks to make you run Tuist project effortlessly\n"
echo "The steps are performed in the following order."
echo "1. Turn off security configuration"
echo "2. Install Homebrew"
echo "3. Install Carthage"
echo "4. Install Tuist\n"

echo "⚠️ Turn off security of your Mac to make Tuist run⚠️.\n🚨 You have to restart your mac 🚨"
echo "You can skip this step But the Tuist command might not be executed well"
echo "Want to Keep Going? (Y/N)"
read turnOffSecurity

if [ ${turnOffSecurity} == "Y" ] ; then
  if spctl --status | grep -q "assessments enabled" ; then
    sudo spctl --master-disable
    echo "the security has turned off. **Please Restart your Mac**"
    kill $$
  fi
  echo "You have already turned off your security configuration."
elif [ ${turnOffSecurity} == "N" ] ; then
  echo "Stop turn Security off."
  echo "I will keep process but please note the Tuist commands might not be executed...😔"
else 
  echo "unknown input. Please restart this shell"
  kill $$
fi

echo "Install Homebrew"
if command -v brew &>/dev/null; then
  echo "Homebrew is already installed on your Mac."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

 
echo "Install Carthage"
brew install carthage
echo "Install Tuist"
curl -Ls https://install.tuist.io | bash

echo "\n 🎉 It's All Done Successfully 🫡"
