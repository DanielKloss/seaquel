<script lang="ts">
  let videoUpload: File;

  async function changed(){
    let url = 'https://file.io/'
    let data = {
      "file": videoUpload,
      "maxDownloads": 1,
      "autoDelete": true
    }
    let response = await fetch(url, {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'content-type': 'application/json'
    }});
    let res = response.json()
    console.log(res)
  }
</script>

<label for="picture">Take a video:</label>

<input type="file"
       name="video"
       accept="video/*"
       capture="environment"
       bind:value={videoUpload}
       on:change={() => changed()}/>