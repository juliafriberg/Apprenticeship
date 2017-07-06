---
title: React Native vs Native in Mobile App Development
date: 2017-07-06 14:00 CEST
author: Julia Friberg
twitter: juliafriberg
tags: android, ios, native, react native
---

As an apprentice aspiring to become an iOS developer, I recently encountered the question on whether to develop an application using the native language and tools or to develop it using [React Native][reactnative]. As I started researching the different approaches I discovered that I was not the first to have to make this decision. I also discovered that the opinions regarding this subject differed a lot. With this blog post, I will guide you through my process of reaching a decision.

First, a brief explanation of the options to choose from. 

A **Native Application** is an application developed for a specific platform. There are two mobile platforms that are significantly more popular than others these days, and they are Android and iOS. When developing for Android, a native application is developed in Android Studio with Java and Kotlin as the languages. For iOS, the IDE is Xcode and the language can be both Objective-C and Swift. 

**React Native** is an open source framework from Facebook, which brings the concepts from web development into mobile development. The development of these applications is done in JavaScript, but the result is still a native application. 

The application that I was going to develop had to be developed for both Android and iOS, and this was the reason for me to consider using React Native. With React Native there is no need to develop two different applications. The same code base can be used for both Android and iOS,  and it even transforms the graphical elements to match the platform. This seemed like the perfect solution for my project, but was it too good to be true? I continued my research to find out what the pros and cons were for each of the alternatives.

[reactnative]: https://facebook.github.io/react-native/

## Native

### Pros

#### API Access
All of the APIs and the functionality that the platform offers can be accessed through a native development environment. There is no extra layer mapping over the functionality that needs to be updated and there are no restrictions or dependencies other than those of the native environment. 

#### Third party libraries
When developing in a native environment, there are a lot of third party libraries to choose from. The community is big and there are lots of resources out there to help improve both the development experience and the application itself.

#### Good to know
Even though apps can be developed through other frameworks, having an understanding of the platform and the underlying architecture is a great advantage. Some functionality can not be done through other frameworks, and therefore knowing the native language is often necessary.

#### Long-term aspects
In the long-term, sticking to the native environment will probably be the safest option. Of course they also update and change their APIs and languages, like Apple did when switching from Objective-C to Swift, but these changes are often backwards compatible and they provide guides for how to port between these changes. At least you can be sure that there is an interest in updating and taking care of the platform. 

#### Strict language
All of the native languages for Android and iOS are so called strict languages which makes hidden errors easier to detect. Since they all are strict, it is quite easy to learn one of the other languages, even though it might take some time to become entirely comfortable.

### Cons

#### You have to develop two applications
The big disadvantage is the fact that each native application only can be run on that specific platform. This means that if you choose to develop natively, you will have to develop two separate applications for your application to work on both Android and iOS. Unfortunately, these two applications will differ a lot, and no code can be shared between them. Of course a backend, which is often a big part of an application, could be the same for both versions.

## React Native
### Pros

#### One code base
As mentioned before, with React Native there is no need to develop two separate applications. Instead the same code base can be used for both Android and iOS. This is a big advantage since there is no need to learn two different languages and platforms, it is enough to know only one.

#### Time
When using React Native to develop a relatively simple app, the time from start to having the application on the market is often shorter than when developing the application natively. This is due to the fact that only one application has to be developed instead of two.

#### Web concepts
For a web developer, going from web to mobile development can be tricky. React Native smooths the transition since it is a JavaScript framework. Most web developers have encountered JavaScript, which makes this way of developing mobile apps more familiar and easier to learn. 

#### Hot reloading
When developing in React Native and a file is saved, the changes are immediately shown on the device where the app is running. This speeds up the process of getting feedback on recent changes.

#### Open source
React Native is open source which comes with the opportunity to inspect the code. This can be helpful to increase the understanding of the framework, but also to help improve the framework by fixing bugs or adding features.

### Cons

#### Does not support all APIs
React Native does not support all of the native APIs. The most used APIs are supported, but sometimes there is a need to access other APIs or functionality. This can be done through native modules that are explained below.

#### Native Modules
Since not all functionality is included in React Native, this has been solved by the introduction of Native Modules. These modules are parts of the code which are written in the native language and then incorporated into the rest of the code. This is a decent way of solving the problem of not having support for all APIs, but it requires the developers to have knowledge about the native language, which is something that the developer perhaps wanted to avoid by choosing React Native. It also results in code duplication since the native module has to be written for both Android and iOS separately. 

#### Third party libraries
React Native has a smaller community than the native platforms, and also less third party libraries. To use the third party libraries developed for the native platform, these incorporations have to be written in native modules.

#### Interaction with other native apps
When wanting to access other native applications, such as the camera, it is a lot easier to do through the native frameworks. React Native does not support this, which means that this has to be written in native modules or through a third party library. 

#### Design
Android and iOS apps look different and have different design guidelines. The graphical elements are automatically transformed to match the given platform, but the placement may still vary. This causes a lot of if-statements or separate code to follow the design guidelines for both platforms.

#### Long-term aspects
There is an uncertainty concerning the long-term support for React Native. Facebook could one day decide to stop updating the framework or the native platform could make changes that are hard to wrap around. 

## How I reached my decision
React Native has its advantages when the application should work for both platforms or when you have a tight time budget. It is also a good choice when the developers have experience in web development or when making a simple application without any complex functionality.

Native is the preferred choice in most other cases. Having knowledge in the native language and the native APIs is needed when developing in React Native as well. This means that if you are a beginner it is strongly recommended to start by developing a native application. 

For me, the choice was hard. The application that was to be developed had some advanced functionality, but not much. It was important for it to be available on both platforms, and for future maintenance React Native was preferred, but not a requirement. I have worked with React before and enjoyed it so the web aspect was familiar to me. 

On the other hand, I am an apprentice to becoming an iOS developer. I have already learned a lot about this kind of development and I feel quite comfortable using Swift. However, I still feel like there is a lot to be learned within this area, and to become a good iOS developer, I need to practice developing native applications. I could also get more help and input from my coworkers if choosing a native approach, which is something that is of great importance when learning. 

In the end I chose to go with a native approach. If I had not been an apprentice, or if my apprentice area had not been in iOS, maybe I would have chosen differently. For the time being, I feel like my personal development will gain more from this, and I think that the end result will be better as well. 