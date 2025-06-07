// Root project build file
plugins {
    kotlin("jvm") version "2.0.21" apply false
}

group = "com.hello-dyn"
version = "1.0.0"

allprojects {
    repositories {
        mavenCentral()
    }
}
