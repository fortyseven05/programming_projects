using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public class Hit : MonoBehaviour {

    public float lifeTime = 2f;

	// Use this for initialization
	void Start ()
    {
        Destroy(gameObject, lifeTime);
	}

    public void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("MainCamera"))
        {
            if (other.CompareTag("Wall"))
            {
                Destroy(gameObject);
            }
            if (other.CompareTag("Tree"))
            {
                Destroy(gameObject);
            }
            if (other.tag == "Enemy")
            {
                EnemyBase enemy = other.gameObject.GetComponent<EnemyBase>();
                if (enemy)
                {
                    enemy.TakeDamage(1);
                    Destroy(gameObject);
                }
                else if (!enemy)
                {
                    print("no enemy script found");
                }

            }
        }
    }


    // Update is called once per frame
    void Update () {
		
	}
}
