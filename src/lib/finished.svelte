<h1 class="sceneTitle">FINISHED</h1>
<div>
    <div class="infoContainer">
        <img class="smallIconImage" src="../icons/map.png" alt="map icon" />
        <p class="sceneInfo">Outside / Dining Room</p>
    </div>
    <div class="infoContainer">
        <img class="smallIconImage" src="../icons/theater.png" alt="theatre icon" />
        <ul>
            <li class="sceneInfo">Director</li>
            <li class="sceneInfo">Producer</li>
        </ul>
    </div>
    <div class="infoContainer">
        <img class="smallIconImage" src="../icons/megaphone.png" alt="context icon" />
        <p class="sceneInfo">Well done! The Salcombe IP Reps will now add up your score. This is also your opportunity to appeal if you wish. Then you can get yourselves a well earned drink while you wait for the final results.</p>
    </div>
    </div>
    <div class="scriptContainer">
        <h2 class="scriptHeader">SCRIPT</h2>
    <div class="lineContainer">
        <div class="left">
            <p class="scriptLine">We'd like to appeal our points total for the [INSERT SCENE HERE] scene</p>
        </div>
        <img class="iconImage" src="../icons/caution.png" alt="appeal" />
    </div>
</div>

<style>
    .sceneTitle {
        background-color: #fde047;
        letter-spacing: 0.35rem;
        text-align: center;
        padding: 1rem;
        font-weight: bold;
    }

    .infoContainer {
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 1rem;
    }

    .iconImage {
        aspect-ratio: 1/1;
        width: 3rem;
    }

    .smallIconImage {
        aspect-ratio: 1/1;
        width: 2rem;
    }

    .left {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .sceneInfo {
        line-height: 1.25rem;
        letter-spacing: 0.025rem;
    }

    .scriptContainer {
        display: flex;
        flex-direction: column;
        font-family: "Courier New";
    }

    .scriptHeader {
        background-color: #94a3b8;
        letter-spacing: 0.35rem;
        text-align: center;
        padding: 1rem;
        font-weight: bold;
    }

    .scriptLine {
        letter-spacing: 0.2rem;
        line-height: 2rem;
    }

    .lineContainer {
        display: grid;
        grid-template-columns: 1fr auto;
        padding: 2rem;
        align-items: center;
        gap: 2rem;
    }
</style>