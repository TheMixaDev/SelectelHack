<template>
  <div></div>
</template>
<script>
export default {
  name: 'RedirectorView',
  mounted() {
    this.$cookies.set("hash", this.$route.query.hash, "30d");
    this.$cookies.set("id", this.$route.query.id, "30d");
    this.$router.push({path: this.$route.query.path});
  }
}
</script>