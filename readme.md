RadioStreamerApp

RadioStreamerApp is a simple Flutter app that streams audio from an online Icecast server. This app allows users to listen to live FM radio broadcasts through an online stream.

Features

Play/Pause Control: Easily start and stop streaming with a single tap.

Minimalistic UI: A clean and modern interface for a smooth user experience.


Screenshots

(Include screenshots of your app here if possible)

Getting Started

Prerequisites

Flutter: Ensure Flutter SDK is installed on your development environment.

Icecast Server: An online Icecast server streaming the desired FM station.


Installation

1. Clone the Repository:

git clone https://github.com/yourusername/RadioStreamerApp.git


2. Navigate to Project Directory:

cd RadioStreamerApp


3. Install Dependencies:

flutter pub get



Running the App

1. Open the Project in Gitpod (if using Gitpod for development):

https://gitpod.io/#<YOUR_REPOSITORY_URL>


2. Replace Streaming URL:

Open lib/main.dart and replace 'http://your-streaming-link' with your actual Icecast streaming link.



3. Run the App:

flutter run



Dependencies

just_audio: For handling audio streaming.

provider: For state management.


License

This project is licensed under the MIT License.
