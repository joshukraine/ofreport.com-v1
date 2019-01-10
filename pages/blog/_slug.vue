<template lang="pug">
article(v-editable="story.content")
  section.relative.bg-cover.bg-top.flex.items-end.h-600px.mb-6(
    :style="{ backgroundImage: 'url(' + story.content.cover_image + ')' }")
    //- Add click event here to display full-res photo?
    .article-hero-gradient
    .article-hero-title.container.text-center.py-8
      h1.text-white.font-normal {{ story.content.title }}
      p.text-white.text-sm {{ story.content.author }} &middot; {{ pubDate }}

      div.px-6(v-if="story.tag_list.length > 0")
        div.inline-block.group(
          v-for="(tag, index) in story.tag_list"
          :key="index")
          nuxt-link.text-black(to="#")
            span.opacity-75.inline-block.rounded-full.bg-white.px-3.py-1.text-xs.font-semibold.mr-2.mb-2(
              class="sm:text-sm md:mb-0 group-hover:opacity-100") &#35;{{ tag }}

  .container
    div.max-w-md.mx-auto.mb-12.border-b.pb-6
      p.text-center.font-bold {{ story.content.caption }}

    component(
      :key="segment._uid"
      v-for="segment in story.content.segments"
      :segment="segment"
      :is="segment.component")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'
import dateFormat from 'dateformat'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return {
      story: {
        content: {
          title: '',
          author: '',
          excerpt: '',
          cover_image: '',
          caption: '',
          segments: []
        }
      }
    }
  },
  computed: {
    pubDate () {
      return dateFormat(this.story.first_published_at, 'mediumDate')
    }
  },
  asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    let endpoint = `cdn/stories/blog/${context.params.slug}`

    return context.app.$storyapi.get(endpoint, {
      version: version
    }).then((res) => {
      return res.data
    }).catch((res) => {
      context.error({ statusCode: res.response.status, message: res.response.data })
    })
  }
}
</script>

<style>
.article-hero-gradient {
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.8) 70%, #000 100%);
  background-size: 100%;
  bottom: 0;
  height: 100%;
  left: 0;
  opacity: 0.7;
  position: absolute;
  right: 0;
}

.article-hero-title {
  bottom: 0;
  left: 0;
  position: absolute;
  right: 0;
}
</style>
