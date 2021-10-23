class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, :only => [:index]

  def index
  end

  def activities
    @activities = [
        { patient: "Terry Baker", event: "Creacion HC", user: "Henry Daniels", type: "doctor", date: "26/07/2021" },
        { patient: "Jennifer Robinson", event: "Modificacion HC", user: "Linda Barret", type: "doctor", date: "24/07/2021" },
        { patient: "", event: "Edicion departamento", user: "Elsa Lopez", type: "administrador", date: "11/07/2021" },
        { patient: "Jennifer Robinson", event: "Creacion HC", user: "Henry Daniels", type: "doctor", date: "10/07/2021" },
        { patient: "Laura Santili", event: "Creacion HC", user: "Linda Barret", type: "doctor", date: "05/07/2021" },
        { patient: "Patient Test", event: "Importacion HC", user: "Henry Daniels", type: "doctor", date: "08/06/2021" },
        { patient: "Guillermo Anton", event: "Exportacion HC", user: "Michael Sullivan", type: "doctor", date: "03/06/2021" },
        { patient: "Laura Santili", event: "Importacion HC", user: "Michael Sullivan", type: "doctor", date: "03/06/2021" },
        { patient: "Melisa Burton", event: "Creacion HC", user: "Linda Barret", type: "doctor", date: "17/05/2021" },
        { patient: "Zulema Varona", event: "Modificacion HC", user: "Elsa Lopez", type: "administrador", date: "15/05/2021" },
        { patient: "Guillermo Anton", event: "Creacion HC", user: "Henry Daniels", type: "recepcion", date: "10/05/2021" },
        { patient: "", event: "Creacion de departamento", user: "Elsa Lopez", type: "administrador", date: "07/04/2021" },
        { patient: "Zulema Varona", event: "Creacion HC", user: "Henry Daniels", type: "doctor", date: "04/04/2021" },
        { patient: "Jennifer Robinson", event: "Modificacion HC", user: "Henry Daniels", type: "doctor", date: "02/04/2021" },
        { patient: "Jennifer Robinson", event: "Modificacion HC", user: "Henry Daniels", type: "doctor", date: "29/03/2021" },
        { patient: "Melisa Burton", event: "Creacion HC", user: "Henry Daniels", type: "doctor", date: "27/03/2021" },
        { patient: "Jennifer Santili", event: "Creacion HC", user: "Linda Barret", type: "doctor", date: "27/03/2021" },
        { patient: "Jennifer Robinson", event: "Creacion HC", user: "Elsa Lopez", type: "administrador", date: "24/03/2021" },
    ]
  end

end
