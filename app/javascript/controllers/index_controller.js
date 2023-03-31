import { application } from "./application"

import TomSelectController from "./tom_select_controller.js"
application.register("tom-select", TomSelectController)

import StarRatingController from "./star_rating_controller.js"
application.register("star-rating", StarRatingController)
