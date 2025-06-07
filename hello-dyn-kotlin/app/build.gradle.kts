plugins {
    kotlin("jvm")
    application
}

group = "com.hello-dyn"
version = "1.0.0"

dependencies {
    implementation(project(":lib"))
}

application {
    mainClass.set("com.hellodyn.app.MainKt")
}

kotlin {
    jvmToolchain(21)
}
