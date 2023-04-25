<script lang="ts">
  let videoUpload: File;

  function changed(){
    console.log(videoUpload);
  }
</script>

<label for="picture">Take a video:</label>

<input type="file"
       name="video"
       accept="video/*"
       capture="environment"
       bind:value={videoUpload}
       on:change={() => changed()}/>