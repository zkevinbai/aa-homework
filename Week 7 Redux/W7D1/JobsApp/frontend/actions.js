export const SWITCH_LOCATION = "SWITCH_LOCATION";

function selectLocation(city, ...jobs){
    return {
        type: SWITCH_LOCATION,
        city: city,
        jobs: jobs
    };
}

export default selectLocation;
