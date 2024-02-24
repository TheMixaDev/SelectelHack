package cache

import (
	"time"

	"github.com/gomodule/redigo/redis"
)

type CacheConn struct {
	pool *redis.Pool
}

var Cache CacheConn

// RedisPoolInit initializes the Redis connection pool.
//
// redisHost: the host address of the Redis server.
func RedisPoolInit(redisHost string) {
	Cache = CacheConn{
		pool: &redis.Pool{
			MaxIdle:     10,
			IdleTimeout: 60 * time.Second,
			Dial: func() (redis.Conn, error) {
				return redis.Dial("tcp", redisHost)
			},
		},
	}
}
