
library(golem)

golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'gymApp'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}


app_ui <- function() {
  
  mod_Home_ui("Home_ui_1")
  mod_Exercises_ui("Exercises_ui_1")
  mod_MuscleGroup_ui("MuscleGroup_ui_1")
  
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),  

    # Define this page as a dashboard page to signal we're using the     dashboard page format
    shinydashboardPlus::dashboardPagePlus(
      
      header = shinydashboardPlus::dashboardHeaderPlus(
        title = "Gym Tracking Dashboard",
        enable_rightsidebar = FALSE
      ),      # Create our navigation menu that links to each of the tabs we defined
      sidebar = shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          # Setting id makes input$tabs give the tabName of currently-selected tab
          id = "tabs",
          shinydashboard::menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
          shinydashboard::menuItem("Muscle Group View", icon = icon("th"), tabName = "mg"),
          shinydashboard::menuItem("Exercise View", icon = icon("bar-chart-o"), tabName = "ev"
          ))
      ),# Show the appropriate tab's content in the main body of our dashboard when we select it
      body = shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          shinydashboard::tabItem("dashboard", mod_Home_ui("Home_ui_1")),
          shinydashboard::tabItem("mg", mod_MuscleGroup_ui("MuscleGroup_ui_1")),
          shinydashboard::tabItem("ev", mod_Exercises_ui("Exercises_ui_1")
          )
        ) 
      ),
      rightsidebar = NULL,
      title = "gymApp Monitoring Dashboard"
    )
  )
}




