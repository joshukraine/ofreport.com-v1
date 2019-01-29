<template lang="pug">
.container
  h1.text-center {{ title }}

  component(
    :key="segment._uid"
    v-for="segment in segments"
    :segment="segment"
    :is="segment.component")
</template>

<script>
export default {
  asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    let endpoint = 'cdn/stories/family'

    return context.app.$storyapi.get(endpoint, {
      version: version
    }).then(res => {
      console.log(res.data)
      return {
        title: res.data.story.content.title,
        segments: res.data.story.content.segments
      }
    })
  }
}
</script>
